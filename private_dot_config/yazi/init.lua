require("mime-ext.local"):setup({

  -- Expand the existing extension database (lowercase), for example:
  with_exts = {
    plist = "application/apple-plist",
  },

  -- If the MIME type is not in both filename and extension databases,
  -- then fallback to Yazi's preset `mime.local` plugin, which uses `file(1)`
  fallback_file1 = true,
})
