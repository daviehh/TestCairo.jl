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



@testset "find_library" begin
    @show l1 = "libpango-1.0"
    @show find_library(l1, [joinpath(Homebrew.prefix(),"lib")])
    
    @show l2 = "libgobject-2.0"
    @show find_library(l2, [joinpath(Homebrew.prefix(),"lib")])
    
    return true #no segfault
end
