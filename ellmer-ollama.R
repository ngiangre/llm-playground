ellmer::models_ollama()

chat <- ellmer::chat_ollama(model = "llama3.2")


get_current_time <- function(tz = "UTC") {
  format(Sys.time(), tz = tz, usetz = TRUE)
}

get_current_time <- ellmer::tool(
  get_current_time,
  name = "get_current_time",
  description = "Returns the current time.",
  arguments = list(
    tz = ellmer::type_string(
      "Time zone to display the current time in. Defaults to `\"UTC\"`.",
      required = FALSE
    )
  )
)

chat$register_tool(get_current_time)

chat$chat("How long ago did Neil Armstrong touch down on the moon?")
# tool calling with llama3.2 is crappy - doesn't use the tool