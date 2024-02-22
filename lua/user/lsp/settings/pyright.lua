return {
  filetypes = { "python" },
	settings = {
    python = {

      analysis = {
        -- executionEnvironments ={
        --   root="/home/code/mask_analysis"
        -- },
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode="off",
        extraPaths={
        "/home/ub/code/fran/",
        --[[ "/home/ub/Dropbox/code/nnUNet/nnunet", ]]
        --[[ "/home/ub/Dropbox/code/tmp/", ]]
        --[[ "/home/ub/Dropbox/code/global_utils/", ]]
        --[[ "/home/ub/Dropbox/code", ]]
        --[[ "/home/ub/Dropbox/code/vtunet/", ]]
        --[[ "/home/ub/Dropbox/code/fran/fran/nbs", ]]
        },
      }

    }
}
}
