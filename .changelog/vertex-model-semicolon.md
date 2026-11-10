fix(vertex): send a `;` in the model as `%3B` in the request path, so a server or proxy that drops `;` and the rest of a path segment no longer drops `:rawPredict` or `:streamRawPredict` with it
