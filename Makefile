create_cluster:
	kind create cluster --name argocd --config config.yml
	kubectl apply -f namespace.yml
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
argo_forward:
	kubectl port-forward svc/argocd-server -n argocd 8080:443
app_forward:
	kubectl port-forward -n demo1 svc/envoy-demo1-eg-0c441390 8000:80
get_argo_ip:
	@echo https://$(shell docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' argocd-control-plane) 
request:
	curl -H "Host: demo.example.com"  -F  'image=@./examples/image.jpeg'  http://localhost:8000/api