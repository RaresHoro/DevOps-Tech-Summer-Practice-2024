# GitOps and ArgoCD Cheat Sheet

## What is GitOps?

- **GitOps** is a set of practices to manage infrastructure and application configurations using Git.
- Git acts as the **single source of truth** for both application code and infrastructure configurations.
- GitOps automates deployments and ensures that the live environment always matches the state described in the Git repository.

### Core Principles of GitOps

1. **Declarative Descriptions**: The desired state of the system is declared in a Git repository.
2. **Version Control**: All changes to the desired state are versioned and managed through Git.
3. **Automated Deployments**: Changes to the Git repository trigger automated deployments to the live environment.
4. **Continuous Reconciliation**: The actual state of the system is continuously compared to the desired state, with discrepancies automatically reconciled.

### Benefits of GitOps

- **Improved Security**: All changes go through Git, providing an audit trail and reducing the risk of unauthorized changes.
- **Simplified CI/CD**: GitOps uses Git as the central point for deployment, reducing the complexity of pipelines.
- **Disaster Recovery**: The entire system state can be recreated from the Git repository.
- **Collaboration**: Teams can collaborate effectively with pull requests, code reviews, and branching.

## What is ArgoCD?

- **ArgoCD** is a declarative, GitOps-based continuous delivery tool for Kubernetes.
- It monitors your Git repository for changes and automatically applies those changes to your Kubernetes clusters.
- ArgoCD ensures that the live state of your Kubernetes applications matches the state defined in your Git repository.

### Key Features of ArgoCD

- **Declarative GitOps CD**: Syncs Kubernetes clusters to the desired state stored in Git repositories.
- **Application Management**: Visualizes the state of applications and provides tools for managing Kubernetes resources.
- **Automatic Rollbacks**: Reverts to the previous version if a deployment fails.
- **Multi-Cluster Support**: Manages applications across multiple Kubernetes clusters.
- **Customizable Sync Policies**: Supports both manual and automated sync strategies.

### ArgoCD Workflow

1. **Setup Git Repository**: Define Kubernetes manifests or Helm charts in a Git repository.
2. **Connect ArgoCD**: ArgoCD is connected to the Git repository and configured to monitor changes.
3. **Deploy Application**: ArgoCD automatically syncs the Kubernetes cluster with the desired state in the Git repository.
4. **Continuous Reconciliation**: ArgoCD continuously monitors the cluster and reconciles any drift from the desired state.

### Installing ArgoCD

- Install ArgoCD on your Kubernetes cluster:

  ```bash
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```

  Access the ArgoCD API Server:

  ```bash
  kubectl port-forward svc/argocd-server -n argocd 8080:443
  ```

## Working with ArgoCD

### Creating an Application

Use the ArgoCD CLI to create an application:

```bash
argocd app create <app_name> \
  --repo <repo_url> \
  --path <path_to_manifests> \
  --dest-server <cluster_url> \
  --dest-namespace <namespace>
```

### Viewing Application Status

Check the status of an application:

```bash
argocd app get <app_name>
```

### Deleting an Application

Delete an ArgoCD application:

```bash
argocd app delete <app_name>
```

### Syncing an Application

Sync an application to ensure the cluster matches the Git repository:

```bash
argocd app sync <app_name>
```

## ArgoCD Application Management

### Sync Policies:

- **Manual Sync**: The user must manually trigger syncs.
- **Automatic Sync**: ArgoCD automatically syncs the application when changes are detected in the Git repository.

### Health Checks:

ArgoCD can be configured to perform health checks on applications, ensuring they are running as expected.

### Rollbacks:

If a deployment fails or if there’s a need to revert, ArgoCD supports rollbacks to previous versions.

## ArgoCD Best Practices

- **Use Git as the Source of Truth**: Store all Kubernetes manifests and configuration files in Git.
- **Automate Syncs for Critical Applications**: Use ArgoCD’s automatic sync feature for applications that require high availability.
- **Monitor Drift**: Regularly monitor the drift between the live environment and the Git repository to ensure consistency.
- **Implement RBAC**: Use ArgoCD’s RBAC policies to control access to applications and clusters.
- **Leverage Helm**: If using Helm, manage your Helm charts via ArgoCD to benefit from GitOps workflows.

## Integrating ArgoCD with CI/CD Pipelines

- **Triggering ArgoCD Syncs**: Integrate ArgoCD with CI tools like Jenkins, GitLab CI, or GitHub Actions to trigger syncs automatically after a successful build.
- **Promotion Pipelines**: Use GitOps workflows to promote changes from dev to staging to production environments via pull requests.
