return {
    "chrisgrieser/nvim-recorder",
    config = function()
        require("recorder").setup {
            slots = { "a", "b" },
            -- clear = true,
            mapping = {
                startStopRecording = "q",
                playMacro = "Q",
                switchSlot = "<C-q>",
                editMacro = "cq",
                deleteAllMacros = "dq",
                yankMacro = "yq",
            },
        }
    end
}
