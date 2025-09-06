# Multi-Stage Docker Build (Django App)
## Overview

This project demonstrates how Docker multi-stage builds can drastically reduce container image size while maintaining flexibility for different tech stacks.
Although the example uses a Django application, the same approach applies to other frameworks and languages.

We provide:

- Traditional Dockerfile (without multi-stage)

- Optimized Dockerfile (with multi-stage)

- Examples of using Ubuntu and Python as base images

## Why Multi-Stage Builds?

When building Docker images, it’s common to include build tools, compilers, and dependencies that are only needed during the build process.
If you ship those into production, your image:
- Bloats in size

- Becomes harder to patch

- Increases attack surface
Multi-stage builds solve this by separating build and runtime into distinct layers.

---

## 📂 Project Structure
```bash
Django-Multi_stage/
├── MultistageDemo/         # Django project code
├── withoutMS/              # Dockerfile without multi-stage
│   └── Dockerfile
├── Dockerfile              # Dockerfile using multi-stage
├── manage.py
└── requirements.txt
```

---

```python
#without multistage
docker build -t no-multi-stage -f withoutMS/Dockerfile

#multistage
docker build -t multi-stage -f Dockerfile

#running container
docker run -d -p 8000:8000 multi-stage [image id]
```
