var _ = require("lodash");

module.exports = {

    parse_env_vars: function(core){
        var argv = process.argv;
        _.each(process.env, function(value, name){
            if(name.indexOf("CS_") == 0){
                name = name.substring(3, name.length).replace(/_/g, "-").toLowerCase();
                flag = ["--", name].join("");
                if(!_.contains(process.argv, flag)){
                    if(_.has(core.options, name)){
                        if(core.options[name].list)
                            value = value.split(",");
                        else
                            value = [value];

                        _.each(value, function(v){
                            argv.push(flag);
                            argv.push(v);
                        });
                    }
                    else if(_.has(core.scheduler.options, name)){
                        if(core.scheduler.options[name].list)
                            value = value.split(",");
                        else
                            value = [value];

                        _.each(value, function(v){
                            argv.push(flag);
                            argv.push(v);
                        });
                    }
                    else if(_.has(core.api.options, name)){
                        if(core.api.options[name].list)
                            value = value.split(",");
                        else
                            value = [value];

                        _.each(value, function(v){
                            argv.push(flag);
                            argv.push(v);
                        });
                    }
                }
            }
        });

        return argv.slice(2);
    }

}
