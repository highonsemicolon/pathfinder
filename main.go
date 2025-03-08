package main

import (
	"encoding/json"
	"io"
	"os"
	"time"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.Any("/*any", func(c *gin.Context) {

		startTime := time.Now()
		body, _ := io.ReadAll(c.Request.Body)
		var jsonBody map[string]any
		if err := json.Unmarshal(body, &jsonBody); err != nil {
			jsonBody = map[string]any{"raw": string(body)}
		}

		response := gin.H{
			"client":          c.ClientIP(),
			"host":            c.Request.Host,
			"method":          c.Request.Method,
			"path":            c.Request.URL.Path,
			"query":           c.Request.URL.RawQuery,
			"formatted_query": c.Request.URL.Query(),
			"proto":           c.Request.Proto,
			"uri":             c.Request.RequestURI,
			"header":          c.Request.Header,
			"body":            jsonBody,
			"env": map[string]string{
				"POD_NAME":         os.Getenv("POD_NAME"),
				"NODE_NAME":        os.Getenv("NODE_NAME"),
				"DOCKER_CONTAINER": os.Getenv("HOSTNAME"),
			},
			"backend_latency_us": time.Since(startTime).Microseconds(),
		}

		c.JSON(200, response)
	})

	r.Run()
}
