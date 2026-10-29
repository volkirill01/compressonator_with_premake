project "CMP_Core"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	warnings "Off"

	targetdir ("%{outputdir}/%{prj.name}")
	objdir ("%{intermediatesdir}/%{prj.name}")

	files
	{
		"cmp_core/source/cmp_core.h",
		"cmp_core/source/cmp_core.cpp",
		"cmp_core/source/core_simd.h",
		"cmp_core/shaders/*.h",
		"cmp_core/shaders/bc1_encode_kernel.cpp",
		"cmp_core/shaders/bc2_encode_kernel.cpp",
		"cmp_core/shaders/bc3_encode_kernel.cpp",
		"cmp_core/shaders/bc4_encode_kernel.cpp",
		"cmp_core/shaders/bc5_encode_kernel.cpp",
		"cmp_core/shaders/bc6_encode_kernel.cpp",
		"cmp_core/shaders/bc7_encode_kernel.cpp",
		"applications/_libs/cmp_math/cpu_extensions.h",
		"applications/_libs/cmp_math/cpu_extensions.cpp",
		"applications/_libs/cmp_math/cmp_math_common.h",
		"applications/_libs/cmp_math/cmp_math_common.cpp",
		"applications/_libs/cmp_math/cmp_math_vec4.h"
	}

	includedirs
	{
		"cmp_core/source",
		"cmp_core/shaders",
		"applications/_libs/cmp_math"
	}

	filter "system:windows"
		systemversion "latest"
	filter {}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"

project "CMP_Core_SSE"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	warnings "Off"

	targetdir ("%{outputdir}/%{prj.name}")
	objdir ("%{intermediatesdir}/%{prj.name}")

	files { "cmp_core/source/core_simd_sse.cpp" }
	includedirs { "cmp_core/source", "cmp_core/shaders" }

	filter "system:windows"
		systemversion "latest"
	filter {}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"

project "CMP_Core_AVX"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	warnings "Off"

	targetdir ("%{outputdir}/%{prj.name}")
	objdir ("%{intermediatesdir}/%{prj.name}")

	files { "cmp_core/source/core_simd_avx.cpp" }
	includedirs { "cmp_core/source", "cmp_core/shaders" }

	filter "system:windows"
		systemversion "latest"
		buildoptions { "/arch:AVX2" }
	filter {}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"

project "CMP_Core_AVX512"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	warnings "Off"

	targetdir ("%{outputdir}/%{prj.name}")
	objdir ("%{intermediatesdir}/%{prj.name}")

	files { "cmp_core/source/core_simd_avx512.cpp" }
	includedirs { "cmp_core/source", "cmp_core/shaders" }

	filter "system:windows"
		systemversion "latest"
		buildoptions { "/arch:AVX512" }
	filter {}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"
