create_cluster:
	kind create cluster --name argocd --config config.yml
	kubectl apply -f namespace.yml
	kubectl apply -f node.yml
argo_forward:
	kubectl port-forward svc/argocd-server -n argocd 8080:443
get_argo_link:
	@echo https://$(shell docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' argocd-control-plane):30430 