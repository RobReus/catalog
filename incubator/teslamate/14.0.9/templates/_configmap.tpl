{{/* Define the configmap */}}
{{- define "teslamate.configmap" -}}
enabled: true
data:
  PORT: "4000"
  DISABLE_MQTT: {{ .Values.teslamate.mqtt.enabled | quote }}
  {{- if .Values.teslamate.mqtt.enabled -}}
  MQTT_HOST: {{ required "MQTT Host is required when MQTT is enabled" .Values.teslamate.mqtt.host | quote }}
  MQTT_PORT: {{ .Values.teslamate.mqtt.port | quote }}
  MQTT_TLS: {{ .Values.teslamate.mqtt.tls | quote }}
  MQTT_TLS_ACCEPT_INVALID_CERTS: {{ .Values.teslamate.mqtt.tlsInvalidCerts | quote }}
  {{- if ne .Values.teslamate.mqtt.namespace -}}
  MQTT_NAMESPACE: {{ .Values.teslamate.mqtt.namespace | quote }}
  {{- end -}}
  {{- end -}}
{{- end -}}
