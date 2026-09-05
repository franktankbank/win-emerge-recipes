package {
    name = "zlib",
    version = "v1.3.2",

    build_mode = "wsl",

    source = {
        url = "https://github.com/madler/zlib",
    },

    dependencies = {},

    build = function(ctx)
        ctx.run("mkdir build")
        ctx.run("cmake -B " .. ctx.cwd .. "/build -DCMAKE_BUILD_TYPE=Release -DZLIB_BUILD_ADA=OFF -DZLIB_BUILD_BLAST=OFF -DZLIB_BUILD_IOSTREAM3=OFF -DZLIB_BUILD_MINIZIP=OFF -DZLIB_BUILD_PUFF=OFF -DZLIB_BUILD_SHARED=OFF -DZLIB_BUILD_STATIC=ON -DZLIB_BUILD_TESTING=OFF -DZLIB_INSTALL=ON -DCMAKE_INSTALL_PREFIX=" .. ctx.prefix .. "/" .. name .. " -DCMAKE_TOOLCHAIN_FILE=" .. ctx.cmake_toolchain_file)
        ctx.run("cmake --build " .. ctx.cwd .. "/build -j " .. ctx.jobs)
    end,

    install = function(ctx)
        ctx.run("cmake --install " .. ctx.cwd .. "/build -j " .. ctx.jobs .. " --strip")
    end,
}
