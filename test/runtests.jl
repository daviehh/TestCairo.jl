using TestCairo, Homebrew, Libdl, Test

@info "installing cairo"

Homebrew.add("graphite2")
Homebrew.add("cairo")
Homebrew.add("pango")
Homebrew.add("fontconfig")
Homebrew.add("libpng")
Homebrew.add("gettext")
Homebrew.add("freetype")
Homebrew.add("libffi")
Homebrew.add("pixman")
#Homebrew.brew(`install cairo`)
@info "done installing cairo"


# function test_libgobject()
#     l = joinpath( Homebrew.prefix(), "lib","libgobject-2.0.dylib" )
#     h = Libdl.dlopen_e(l, Libdl.RTLD_LAZY)
# end

# @info "opening libgobject in function"
# @show test_libgobject()
# @info "done opening libgobject in function"


@testset "opening dylib" begin
    @show l = joinpath(Homebrew.prefix(),"lib","libpango-1.0.dylib" )
    @show h = Libdl.dlopen(l,Libdl.RTLD_LAZY)
    @test h != C_NULL
    Libdl.dlclose(h)
    
    @show l = joinpath(Homebrew.prefix(),"lib","libgobject-2.0.dylib" )
    @show h = Libdl.dlopen(l,Libdl.RTLD_LAZY)
    @test h != C_NULL
    Libdl.dlclose(h)
    return true
end

@testset "find_library" begin
    @show l = joinpath(Homebrew.prefix(),"lib","libpango-1.0.dylib" )
    @show find_library(l)
    
    @show l2 = joinpath(Homebrew.prefix(),"lib","libgobject-2.0.dylib" )
    @show find_library(l2)
    return true
end
