#!/usr/bin/env node
var _ = require("lodash");
var fs = require("fs");
var pkg = require([__dirname, "package"].join("/"));
var nomnom = require("nomnom");
var CLI = require("containership.cli");
var Core = require("containership.core");
var Scheduler = require("containership.scheduler");
var API = require("containership.api");
var daemon = require("daemon");
var mkdirp = require("mkdirp");
var utils = require([__dirname, "utils"].join("/"));

try{
    mkdirp.sync([process.env["HOME"], ".containership", "plugins", "node_modules"].join("/"));
}
catch(e){}

var scheduler = new Scheduler();
var api = new API();

var core = new Core({
    scheduler: scheduler,
    api: api
});

var commands = {
    agent: {
        init: function(options){
            if(process.env.NODE_ENV != "development"){
                daemon({
                    stdout: process.stdout,
                    stderr: process.stderr
                });
            }

            var pid_location = "/var/run/containership.pid";
            fs.writeFile(pid_location, process.pid, function(err){
                if(err){
                    process.stderr.write("Error writing PID! Are you running containership as root?\n");
                    process.exit(1);
                }
                else{
                    options.version = pkg.version;
                    options.mode = options.mode;
                    core.scheduler.load_options(_.pick(options, _.keys(core.scheduler.options)));
                    core.api.load_options(_.pick(options, _.keys(core.api.options)));
                    core.load_options(options);
                    core.initialize();
                }
            });
        },

        options: core.options
    }
}

var cli = new CLI();
_.merge(commands, cli.commands);

nomnom.option("version", {
    flag: true,
    abbr: "v",
    help: "print version and exit",
    callback: function(){
        return ["v", pkg.version].join("")
    }
});

var available_commands = fs.readdirSync([__dirname, "commands"].join("/"));
_.each(available_commands, function(command){
    var command_name = command.split(".")[0];
    commands[command_name] = require([__dirname, "commands", command].join("/"));
});

_.each(commands, function(command, name){
    if(_.has(command, "middleware"))
        cli.set_middleware(command.middleware);

    nomnom.command(name).options(command.options).callback(command.init);
});

if(_.has(commands, process.argv[2]) && _.has(commands[process.argv[2]], "nomnom")){
    nomnom = commands[process.argv[2]].nomnom;
    var args = utils.parse_env_vars(core).slice(1);
}
else
    var args = utils.parse_env_vars(core);

nomnom.parse(args);
