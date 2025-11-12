# fix_cmake_warning.ps1
Write-Host "🔧 Checking for Firebase CMakeLists.txt file..."

$path = "build/windows/x64/extracted/firebase_cpp_sdk_windows/CMakeLists.txt"

if (Test-Path $path) {
    Write-Host "✅ Found CMakeLists.txt — updating..."
    (Get-Content $path) |
        ForEach-Object {
            $_ -replace 'cmake_minimum_required\(VERSION 3\.[0-9]+\)', 'cmake_minimum_required(VERSION 3.10)'
        } |
        Set-Content $path
    Add-Content $path "`inset(CMAKE_SUPPRESS_DEVELOPER_WARNINGS 1 CACHE INTERNAL 'No dev warnings')"
    Write-Host "✨ Firebase CMake file fixed successfully!"
} else {
    Write-Host "⚠️ Firebase CMakeLists.txt not found yet. Build once to generate it."
}
