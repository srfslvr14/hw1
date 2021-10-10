{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_hw1_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/bin"
libdir     = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/lib/x86_64-linux-ghc-8.10.4/hw1-haskell-0.1.0.0-612Zfo2LtRG6hhmWa28uOc"
dynlibdir  = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/share/x86_64-linux-ghc-8.10.4/hw1-haskell-0.1.0.0"
libexecdir = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/libexec/x86_64-linux-ghc-8.10.4/hw1-haskell-0.1.0.0"
sysconfdir = "/workspaces/cs114a-devcontainer-0.1.5.2/hw1/.stack-work/install/x86_64-linux-tinfo6/b8c14e9b510fe375c8204fa912b6b3f1b9feb26ecd9985cf8b33beadad498665/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hw1_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hw1_haskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "hw1_haskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "hw1_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hw1_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hw1_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
