u = "https://github.com/netwide-assembler/nasm.git"
v = latest_version(u, "git", "^nasm-\\d+\\.\\d+(?:\\.\\d+)?(?:[a-z]+\\d*(?:-\\w+)?)?(?:rc\\d+)?$")

package {
    name = "nasm",
    version = v,

    build_mode = "wsl",

    source = {
        url = u,
    },

    dependencies = {
        "zlib",
    },

    build = function(ctx)
        vcpkg.clean()
        vcpkg.foreach_dep(dependencies)
        ctx.run("./autogen.sh")
        ctx.run("./configure --with-zlib=" .. vcpkg.prefix .. " --prefix=" .. ctx.prefix .. "/" .. name .. " --host=" .. ctx.target)
        ctx.run("make -j" .. ctx.jobs)
    end,

    install = function(ctx)
        ctx.run("make install")
    end,
}
