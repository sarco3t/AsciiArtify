
## Команди

```Makefile
app_forward:
	kubectl port-forward -n demo1 svc/envoy-demo1-eg-0c441390 8000:80
request:
	curl -H "Host: demo.example.com"  -F  'image=@./examples/image.jpeg'  http://localhost:8000/api # зробити example запит
```

## Demo

[🎥 Демо ArgoCD UI](https://raw.githubusercontent.com/sarco3t/AsciiArtify/main/demo/mvp.mp4)

<video controls width="500">
  <source src="https://raw.githubusercontent.com/sarco3t/AsciiArtify/main/demo/mvp.mp4" type="video/mp4">
</video>