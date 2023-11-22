{{/* Define the secrets */}}
{{- define "teslamate.secrets" -}}

{{- $encryptionKey := .Values.teslamate.encryptionKey | default (randAlphaNum 48) | quote -}}
{{- $mqttUsername := .Values.teslamate.mqtt.username | quote -}}
{{- $mqttPassword := .Values.teslamate.mqtt.password | quote -}}

enabled: true
data:
  ENCRYPTION_KEY: placeholdervalue
  {{- if .Values.teslamate.mqtt.enabled -}}
  {{- if ne $mqttUsername -}}
  MQTT_USERNAME: {{ $mqttUsername }}
  {{- end -}}
  {{- if ne $mqttPassword -}}
  MQTT_PASSWORD: {{ $mqttPassword }}
  {{- end -}}
  {{- end -}}
{{- end -}}
