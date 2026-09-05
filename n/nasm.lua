package {
    name = "nasm",
    version = "nasm-3.02",

    build_mode = "wsl",

    source = {
        url = "https://github.com/netwide-assembler/nasm",
    },

    dependencies = {
        "zlib",
    },

    build = function(ctx)
        ctx.run("./autogen.sh")
        ctx.run("./configure --with-zlib=" .. ctx.prefix .. " --prefix=" .. ctx.prefix .. "/" .. name .. " --host=" .. ctx.target)
        ctx.run("make -j" .. ctx.jobs)
    end,

    install = function(ctx)
        ctx.run("make install")
    end,
}
