# Локальний кластер з ArgoCD (Kind + Kubernetes)

Цей проєкт дозволяє швидко створити локальний кластер Kubernetes за допомогою [`kind`](https://kind.sigs.k8s.io/) і встановити ArgoCD.

---

## Команди

```Makefile
create_cluster:
	kind create cluster --name argocd --config config.yml
	kubectl apply -f namespace.yml
	kubectl apply -f node.yml

argo_forward:
	kubectl port-forward svc/argocd-server -n argocd 8080:443

get_argo_link:
	@echo https://$(shell docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' argocd-control-plane):30430
```

## Demo

[🎥 Демо ArgoCD UI](https://raw.githubusercontent.com/sarco3t/AsciiArtify/main/demo/poc.mp4)

<video controls width="500">
  <source src="https://raw.githubusercontent.com/sarco3t/AsciiArtify/main/demo/poc.mp4" type="video/mp4">
</video>