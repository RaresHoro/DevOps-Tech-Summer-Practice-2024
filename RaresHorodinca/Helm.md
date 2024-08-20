# What is Helm?

- **Helm** is a package manager for Kubernetes, helping you define, install, and upgrade even the most complex Kubernetes applications.
- A **Helm chart** is a collection of files that describe a related set of Kubernetes resources.

## Helm Components

- **Chart**: A Helm package containing all Kubernetes manifests that define resources.
- **Release**: An instance of a chart running in a Kubernetes cluster.
- **Repository**: A place to store and share charts.

## Basic Helm Commands

### Creating a Helm Chart

```bash
helm create mychart
```

### Installing a Chart

```bash
helm install myrelease ./mychart
```

### Listing Releases

```bash
helm list
```

### Upgrading a Release

```bash
helm upgrade myrelease ./mychart
```

### Rolling Back a Release

```bash
helm rollback myrelease 1
```

### Uninstalling a Release

```bash
helm uninstall <release_name>
```

## Helm Chart Structure

- **Chart.yaml**: Metadata about the chart (name, version, etc.).
- **values.yaml**: Default values for the chart's templates.
- **templates/**: Contains Kubernetes manifests that are used to install/upgrade the application.
- **charts/**: A directory to store dependencies (other charts).
- **NOTES.txt**: Optional help message after the installation.

## Using Values in Helm Charts

Values from `values.yaml` can be accessed in templates using `{{ .Values.<key> }}`.

```bash
helm install <release_name> <chart_path> -f custom-values.yaml
```

## Helm Repositories

### Adding a Repository

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
```

### Updating Repositories

Update your Helm repositories to get the latest charts:

```bash
helm repo update
```

### Searching for Charts

### Fetching a Chart

Download a chart without installing it:

```bash
helm pull <repo_name>/<chart_name> --untar
```

## Helm Best Practices

- **Use values.yaml for configuration**: Store configurable parameters in the `values.yaml` file.
- **Version control your Helm charts**: Treat Helm charts like any other code and store them in version control.
- **Keep secrets secure**: Don’t hardcode secrets in `values.yaml`. Use Kubernetes secrets or external tools for managing them.
- **Use Helm repositories**: Reuse charts by storing them in a Helm repository for your team or organization.
