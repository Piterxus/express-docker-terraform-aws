# ⚙️ Infraestructura como Código con Terraform y GitHub Actions

Este repositorio contiene una infraestructura definida mediante **Terraform**, automatizada a través de **GitHub Actions** para facilitar el ciclo de vida completo: `plan`, `apply` y `destroy`.

---

## 📦 Tecnologías utilizadas

- [Terraform](https://www.terraform.io/) – Infraestructura como código
- [GitHub Actions](https://docs.github.com/en/actions) – Automatización de flujos CI/CD
- AWS como proveedor de infraestructura

---

## 🚀 Funcionalidades

- Despliegue automatizado de infraestructura mediante *push* a `main`
- Planificación (`terraform plan`) en *pull requests*
- Destrucción (`terraform destroy`) controlada a través de un artefacto persistente
- Almacenamiento remoto del estado (ej. S3) y bloqueo (ej. DynamoDB)

---

## 📂 Estructura del repositorio

```bash
terraform/
├── main.tf              # Definición principal de recursos
├── variables.tf         # Variables de entrada
├── outputs.tf           # Salidas útiles tras el despliegue
├── backend.tf           # Configuración del estado remoto
.github/
└── workflows/
    ├── terraform.yml    # Plan y Apply automatizados
    └── destroy.yml      # Destrucción de recursos mediante artefacto
🔄 Flujo de trabajo
✅ Planificación (terraform plan)
Al crear un pull request:

Se ejecuta terraform init y terraform plan

El resultado se muestra como comentario en el PR

🚀 Despliegue (terraform apply)
Al hacer push a main:

Se aplica automáticamente la infraestructura

💣 Destrucción (terraform destroy)
Dado que terraform destroy no debe ejecutarse automáticamente por seguridad, se ha creado un flujo manual en GitHub Actions que requiere la recuperación previa del estado remoto.

Dificultad superada: Para que destroy funcione correctamente en GitHub Actions, fue necesario almacenar el estado remoto como artefacto en un paso previo, y restaurarlo durante el flujo de destrucción.

Pasos para destruir:

Accede a la pestaña Actions

Selecciona el flujo Terraform Destroy

Haz clic en Run workflow y proporciona los parámetros necesarios (si aplica)

🛠 Requisitos
AWS CLI configurado (si lo pruebas localmente)

Terraform instalado (>= 1.0)

Variables de entorno o secretos configurados en GitHub:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

TF_BACKEND_BUCKET, TF_BACKEND_KEY, etc. si usas estado remoto

💡 Buenas prácticas aplicadas
Uso de terraform fmt, validate y tflint para validación

Separación clara de entornos (dev, prod, etc.) si aplica

Minimización de privilegios en las credenciales utilizadas

Uso de artefactos de GitHub Actions para preservar estado

