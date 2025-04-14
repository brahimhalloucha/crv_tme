# 🚀 CRV_TME — Autoscaling Infrastructure with Kubernetes, Prometheus & Grafana

This project demonstrates how to containerize and orchestrate a modern web application using **Docker**, **Kubernetes**, **Redis (master/replica)**, and **LocalTunnel**, while integrating **Prometheus** and **Grafana** for observability.

---

## 🛠️ Project Overview

- **Backend**: Node.js with Redis integration  
- **Frontend**: React  
- **Database**: Redis with a master/replica setup  
- **Monitoring**: Prometheus and Grafana  
- **Exposing services**: LocalTunnel & NodePorts  
- **Container Orchestration**: Kubernetes  
- **IaC structure**: Organized Kubernetes manifests by component

---

## 📦 Step 1: Build Docker Images (Optional)

You can either build the images locally or pull them from Docker Hub.

### 🔧 Option A: Build Locally

```bash
# Backend
cd Dockerfiles/backend
docker build -t backend-img .

# Frontend
cd ../frontend
docker build -t frontend-img .
```

### 🌐 Option B: Pull from Docker Hub

```bash
docker pull brahimhalloucha/backend-img
docker pull brahimhalloucha/frontend-img
```

---

## ☸️ Step 2: Start Minikube Cluster

```bash
minikube start
```

---

## 🐳 Step 3: Load Images into Minikube (if built locally)

```bash
minikube image load backend-img
minikube image load frontend-img
```

*Skip this step if you are pulling from Docker Hub inside Kubernetes.*

---

## 🚀 Step 4: Deploy All Components

```bash
# Redis (master + replica)
minikube kubectl -- apply -f kubernetes/redis/
minikube kubectl -- apply -f kubernetes/redis-replica/

# Backend Node.js API
minikube kubectl -- apply -f kubernetes/node-server/

# React Frontend
minikube kubectl -- apply -f kubernetes/frontend/

# Prometheus
minikube kubectl -- apply -f prometheus/

# Grafana
minikube kubectl -- apply -f grafana/
```

---

## 🌐 Step 5: Access Services

```bash
# Prometheus
minikube service prometheus-service

# Grafana
minikube service grafana

# Backend
minikube service node-server-service

# Frontend
minikube service frontend-service
```

---

## 📊 Step 6: Configure Grafana

1. Open Grafana (default login: `admin` / `admin`)
2. Add a **Prometheus** data source:
   - **Type**: Prometheus
   - **URL**: `http://prometheus-service:9090`
3. Import community dashboards, such as:
   - **Node Exporter Full**: ID `1860`
   - **Kubernetes Cluster Monitoring**: ID `6417`

---

## 🌍 Step 7: Expose Backend with LocalTunnel

```bash
chmod +x start-localtunnel.sh
./start-localtunnel.sh
```

This will expose your backend service publicly at:  
➡️ **https://backend-crv.loca.lt**

---

## 📁 Project Structure

```
crv_tme/
│
├── Dockerfiles/
│   ├── backend/
│   └── frontend/
│
├── kubernetes/
│   ├── redis/
│   ├── redis-replica/
│   ├── node-server/
│   └── frontend/
│
├── prometheus/
│   ├── prometheus-config.yaml
│   ├── prometheus-deployment.yaml
│   └── prometheus-service.yaml
│
├── grafana/
│   └── grafana-deployment.yaml
│
├── start-localtunnel.sh
└── README.md
```

---

## 💡 Features

- ✅ Node.js + Redis backend  
- ✅ React frontend  
- ✅ Redis replication (master/replica)  
- ✅ Kubernetes-based orchestration  
- ✅ Monitoring with Prometheus + Grafana  
- ✅ Public exposure via LocalTunnel  
- ✅ Docker images available via Docker Hub  
- ✅ Fully containerized & scalable infrastructure  

---

## 👤 Author

> [brahimhalloucha](https://github.com/brahimhalloucha)

---

