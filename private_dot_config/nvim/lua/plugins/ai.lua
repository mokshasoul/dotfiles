return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "mistral",
      providers = {
        mistral = {
          __inherited_from = "openai",
          api_key_name = "MISTRAL_API_KEY",
          endpoint = "https://api.mistral.ai/v1/",
          model = "mistral-medium-3-5",
          extra_request_body = {
            max_tokens = 4096, -- to avoid using max_completion_tokens
          },
        },
      },
      acp_providers = {
        ["mistral-vibe"] = {
          command = "vibe-acp",
          env = {
            MISTRAL_API_KEY = os.getenv("MISTRAL_API_KEY"), -- necessary if you setup Mistral Vibe manually
          },
        },
      },
    },
  },
}
