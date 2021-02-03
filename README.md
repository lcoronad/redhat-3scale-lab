# redhat-3scale-lab

Laboratorio para crear un API en 3scale

## Aplicación a usar

> Este laboratorio asume que esta desplegada la aplicación consulta de saldo en OpenShift y funciona correctamente, para desplegarla siga los pasos del archivo de instalación.

## Configuración de API en 3scale

> Por medio de los siguientes pasos se creara un API en 3scale 2.9

### Crear el Backend

> Ingresar a la URL [Admin Portal 3scale](https://apidev-admin.apps.adesaocp1.nh.inet/), las credenciales las indicará el instructor

> Seleccionar el tab Backends de la sección de APIs del Dashboard de 3scale

> Hacer clic en el link "NEW BACKEND"

> Crear el backend con la siguiente información, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create Backend"

```
Name: Consulta Saldo BK X
System name: consulta_saldo_bk_x
Description: Backend que implementa la consulta de saldo.
Private Base URL: http://consulta-saldo-poc3scale.apps.adesaocp1.nh.inet
```

### Crear y configurar el producto

> Seleccionar el tab Products de la sección de APIs del Dashboard de 3scale

> Hacer clic en el link "NEW PRODUCT"

> Crear el product con la siguiente información, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create Product"

```
Seleccione el check box de Define manually
Name: Consulta Saldo API X
System name: consulta_saldo_api_x
Description: API que expone la consulta de saldo
```

> Seleccione la opción Settings en la siguiente ruta Integration -> Settings y diligencie la siguiente información

```
Deployment: APIcast 3scale managed
Authentication: OpenID Connect
OpenID Connect Issuer Type: Red Hat Single Sign-On
OpenID Connect Issuer: https://3scale-sso-sync:494c2a35-8868-4bc8-9981-6531d82c863c@sso-sso-app.apps.adesaocp1.nh.inet/auth/realms/api-ext-dev
OICD Authorization Flow: Service Accounts Flow
El resto de la parametrización dejarla por defecto.
```

> Tome nota del host generado para el APICast staging.

> Seleccione la opción Backends en la siguiente ruta Integration -> Backends, haga clic en el link Add Backend, diligencie la siguiente información y al final haga clic en el botón "Add to Product"

```
Backend: Consulta Saldo BK X
Path: /
```

> Seleccione la opción Policies en la siguiente ruta Integration -> Policies, haga clic en el link Add Policy, seleccione la política Logging, haga clic en Logging, diligencie la siguiente información y al final haga clic en el botón "Update Policy" y después en el botón "Update Policy Chain"


```
Seleccione el check box enable_access_logs
Custom logging format: [{{time_local}}] response_api_consulta_saldo_X {{host}}:{{server_port}} {{remote_addr}}:{{remote_port}} \"{{request}}\" {{status}} {{body_bytes_sent}} ({{request_time}}) {{post_action_impact}}
```

> Seleccione la opción Methods & Metrics en la siguiente ruta Integration -> Methods & Metrics, haga clic en el link New method, diligencie la siguiente información, reemplace x con el número asignado a cada integrante y al final haga clic en el botón "Create Method"


```
Friendly name: Consulta Saldo X
System name: consulta_saldo_method_x
Description: Metodo para el endpoint de consulta de saldo
```

> Seleccione la opción Mapping Rules en la siguiente ruta Integration -> Mapping Rules, haga clic en el link Add Mapping Rule, diligencie la siguiente información y al final haga clic en el botón "Create Mapping Rule"

```
Verb: POST
Pattern: /consultaSaldo
Metrics or Method to increment: Consulta Saldo X
Deja el resto de la información por defecto
```

> Seleccione la opción Application Plans en la siguiente ruta Applications -> Application Plans, haga clic en el Create Application Plan, diligencie la siguiente información, reemplace x con el número asignado a cada integrante y al final haga clic en el botón "Create Application Plan"

```
Name: Plan Ilimitado Saldo X
System name: plan_ilimitado_saldo_x
Deje el resto de la información por defecto
```

> Haga clic en el link "Publish"

> Seleccione la opción ActiveDocs, haga clic en el link "Create your first spec", diligencie la siguiente información, reemplace x con el número asignado a cada integrante y al final haga clic en el botón "Create Service"

```
Name: Swagger consulta saldo x
System name: swagger_consulta_saldo_x
Seleccione el check box Publish?
Description: Documentación API consulta de saldo
API JSON Spec: 
{
  "swagger": "2.0",
  "info": {
    "version": "1.0",
    "title": "\"Consulta Saldo\""
  },
  "host": "0.0.0.0",
  "basePath": "/",
  "tags": [
    {
      "name": "consultas",
      "description": "\"Consultar Saldo\""
    }
  ],
  "schemes": [
    "http"
  ],
  "paths": {
    "/consultaSaldo": {
      "post": {
        "tags": [
          "consultas"
        ],
        "summary": "\"Consultar Saldo\"",
        "operationId": "consultaSaldo",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "in": "body",
            "name": "body",
            "required": true,
            "schema": {
              "$ref": "#/definitions/ConsultaSaldoRequest"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "success",
            "schema": {
              "$ref": "#/definitions/ConsultaSaldoResponse"
            }
          }
        }
      }
    },
    "/health": {
      "get": {
        "tags": [
          "consultas"
        ],
        "summary": "\"Health\"",
        "operationId": "health",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "responses": {
          "200": {}
        }
      }
    }
  },
  "definitions": {
    "ConsultaSaldoRequest": {
      "type": "object",
      "properties": {
        "numeroCuenta": {
          "type": "string"
        }
      }
    },
    "ConsultaSaldoResponse": {
      "type": "object",
      "properties": {
        "saldo": {
          "type": "number"
        },
        "fecha": {
          "type": "string",
          "format": "date-time"
        }
      }
    }
  }
}
Seleccione el check box Skip swagger validations
```

> Seleccione la opción Configuration en la siguiente ruta Integration -> Configuration, haga clic en el botón "Promote v. 1 to Staging APICast", después promueva la versión al API cast de Producción haciendo clic en el botón "Promote v. 1 to Production APICast"

### Crear la cuenta y la aplicación

> Seleccione la Opción Audience en el select de la parte superior e ingrese a la ruta Accounts -> Listing, haga clic en el link "Create", diligencie los siguientes datos, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create".

```
Username: user_admin_x
Email: user_admin_x@telefonica.com.co
Password: (genere uno que recuerde)
Organization: Cuenta X
```

> Omita este paso si la cuenta no tiene una aplicación asociada por defecto, una vez este dentro de la cuenta, seleccione el link "Applications" de la parte superior, haga clic en la aplicación que se creo por defecto, posteriormente haga clic en el link Edit, haga clic en el botón "Delete"

> Omita este paso si la cuenta no tiene una suscripción asociada por defecto, seleccione el link Service Suscriptions, haga clic en el link "Unsubscribe", acepte el mensaje emergente

> Posteriormente haga clic en el link "Subscribe" del Service Consulta Saldo X, seleccione el Plan Default y haga clic en el botón "Create Subscription".

> Vuelva al link de Applications de la parte superior, haga clic en link "Create Application", diligencie los siguientes datos, reemplace x con el número asignado a cada integrante y haga clic en el botón "Create Application".

```
Application plan: Plan Ilimitado Saldo X
Service plan: Default
Name: Aplication X
Description: Aplicacion de ejemplo para consumir el API de consulta de saldo
```

> Tome nota del client_id y client_secret que se generaron para la aplicación

> Preguntele al instructor si su client_id se creo correctamente en SSO

### Pruebe el consumo del API

> Con la aplicación Postman realice el consumo del servicio, configurando la URL (reemplace el {host_API} por el host guardado del APICast Staging), la opción de authorization y el body respectivo, si tiene dudas preguntele al instructor

```
Methodo: POST
URL API: https://{host_API}/consultaSaldo

URL token: https://sso-sso-app.apps.adesaocp1.nh.inet/auth/realms/api-ext-dev/protocol/openid-connect/token
Client ID: <El que se tomo del punto anterior>
Client Secret: <El que se tomo del punto anterior>

Body:
{
    "numeroCuenta": "325418764522"
}
```

> Verifique que reciba una respuesta como esta:

```
{
    "saldo": 2300000,
    "fecha": "2020-11-18T20:12:57.079+00:00"
}
```

> Ingrese al admin portal y verifique la gráfica de Analytics del API que desarrollo, preguntele al instructor que revise el log del APICast para determinar si se escribe el log de la política configurada.

> Realice cambios en la información de seguridad, pruebe el servicio y verifique la respuesta que obtiene.
