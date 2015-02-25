var child_process = require("child_process");
var _ = require("lodash");
var pkg = require([__dirname, "..", "package"].join("/"));

module.exports = {

    init: function(options){
        if(process.platform == "win32")
            var npm = "npm.cmd";
        else
            var npm = "npm";

        var url = pkg.repository.update_url;
        var message = ["Updating Containership to"];
        var args = ["install", "-g"];

        if(_.has(options, "tag")){
            args.push(["containership", options.tag].join("@"))
            message = [message, "version", options.tag].join(" ");
        }
        else{
            args.push("containership");
            message = [message, "latest version"].join(" ");
        }

        console.log(message);

        child_process.spawn(npm, args, {
          stdio: "inherit"
        });
    },

    options: {
        tag: {
            help: "Specific Containership tag to download",
            required: false,
            abbr: "t"
        }
    }
}
