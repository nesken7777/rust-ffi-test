import Lake
open Lake DSL

package «rust-ffi-test» where
  moreLinkArgs := #["-lntdll"]
  -- precompileModules := true
  -- add package configuration options here

lean_lib «RustFfiTest» where
  -- add library configuration options here

@[default_target]
lean_exe «rust-ffi-test» where
  root := `Main

extern_lib rust_ffier pkg := do
  proc { cmd := "cargo", args := #["build", "--release"], cwd := pkg.dir }
  let name := nameToStaticLib "librust_ffier"
  let srcPath := pkg.dir / "target" / "release" / name
  IO.FS.createDirAll pkg.leanLibDir
  let tgtPath := pkg.leanLibDir / name
  IO.FS.writeBinFile tgtPath (← IO.FS.readBinFile srcPath)
  let linkableName := "lib".append name
  let tgtPath' := pkg.leanLibDir / linkableName
  IO.FS.writeBinFile tgtPath' (← IO.FS.readBinFile srcPath)
  (pure (pure tgtPath) : FetchM (BuildJob FilePath))
