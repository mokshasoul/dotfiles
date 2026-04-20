return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "mistral",
      providers = {
        mistral = {
          __inherited_from = "openai",
          api_key_name = "MISTRAL_API_KEY",
          endpoint = "https://api.mistral.ai/v2/",
          model = "devstral-2",
          extra_request_body = {
            max_tokens = 4096, -- to avoid using max_completion_tokens
          },
        },
      },
    },
  },
}
