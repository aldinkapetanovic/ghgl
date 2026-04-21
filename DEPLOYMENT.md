# Deployment Guide

This guide covers various deployment options for GHGL.

## Table of Contents

1. [Docker](#docker)
2. [Docker Compose](#docker-compose)
3. [Kubernetes](#kubernetes)
4. [Helm](#helm)
5. [Production Checklist](#production-checklist)

## Docker

### Build the Image

```bash
docker build -t ghgl:latest .
```

### Run the Container

```bash
docker run -p 5000:5000 \
  -e FLASK_ENV=production \
  -e SECRET_KEY=your-secret-key \
  ghgl:latest
```

### Push to Registry

```bash
# Docker Hub
docker tag ghgl:latest your-username/ghgl:latest
docker push your-username/ghgl:latest

# GitHub Container Registry
docker tag ghgl:latest ghcr.io/your-username/ghgl:latest
docker push ghcr.io/your-username/ghgl:latest
```

## Docker Compose

### Development

```bash
docker-compose up -d
```

### Scaling

```bash
docker-compose up -d --scale app=3
```

### Logs

```bash
docker-compose logs -f app
```

## Kubernetes

### Prerequisites

- kubectl configured
- Kubernetes cluster running (1.20+)

### Deploy with kubectl

```bash
# Create namespace
kubectl create namespace ghgl

# Apply manifests
kubectl apply -f kubernetes/

# Check deployment
kubectl get pods -n ghgl
kubectl get svc -n ghgl
```

### Port Forwarding

```bash
kubectl port-forward -n ghgl svc/ghgl-service 5000:80
```

### Scaling

```bash
kubectl scale deployment ghgl-app --replicas=5 -n ghgl
```

### Health Checks

```bash
kubectl logs -n ghgl -l app=ghgl
kubectl describe pods -n ghgl
```

## Helm

### Install

```bash
helm install ghgl ./helm/ghgl \
  -n ghgl \
  --create-namespace \
  -f helm/ghgl/values.yaml
```

### Upgrade

```bash
helm upgrade ghgl ./helm/ghgl -n ghgl
```

### Rollback

```bash
helm rollback ghgl -n ghgl
```

### Uninstall

```bash
helm uninstall ghql -n ghgl
```

### Custom Values

```bash
helm install ghgl ./helm/ghgl \
  -n ghgl \
  --create-namespace \
  --set replicaCount=5 \
  --set image.repository=my-registry/ghgl \
  --set ingress.enabled=true \
  --set ingress.hosts[0].host=api.example.com
```

## Production Checklist

### Security

- [ ] Change `SECRET_KEY` to a strong value
- [ ] Set `FLASK_ENV=production`
- [ ] Use HTTPS/TLS in production
- [ ] Enable network policies
- [ ] Configure RBAC properly
- [ ] Use private image registries
- [ ] Implement authentication/authorization

### Performance

- [ ] Configure resource requests/limits
- [ ] Set up HPA (Horizontal Pod Autoscaler)
- [ ] Enable caching strategies
- [ ] Monitor database queries
- [ ] Use CDN for static assets
- [ ] Enable compression

### Monitoring

- [ ] Set up logging aggregation
- [ ] Configure metrics collection
- [ ] Create alerting rules
- [ ] Monitor application errors
- [ ] Track performance metrics

### High Availability

- [ ] Run multiple replicas (min 3)
- [ ] Configure pod disruption budgets
- [ ] Use multi-zone deployments
- [ ] Implement graceful shutdown
- [ ] Configure connection pools

### Backup & Recovery

- [ ] Document recovery procedures
- [ ] Test backup restoration
- [ ] Configure automated backups
- [ ] Document rollback procedures

## Environment Variables

### Required

```bash
FLASK_ENV=production
SECRET_KEY=<strong-random-key>
```

### Optional

```bash
LOG_LEVEL=INFO
CORS_ORIGINS=https://example.com
```

## Troubleshooting

### Pods not starting

```bash
kubectl describe pod <pod-name> -n ghgl
kubectl logs <pod-name> -n ghgl
```

### High CPU/Memory

- Check resource limits
- Review application logs
- Adjust HPA thresholds
- Profile application

### Connection issues

- Verify network policies
- Check service discovery
- Review ingress configuration
- Test DNS resolution

### Image pull errors

- Verify image registry credentials
- Check image name and tag
- Ensure registry is accessible
- Review imagePullPolicy
