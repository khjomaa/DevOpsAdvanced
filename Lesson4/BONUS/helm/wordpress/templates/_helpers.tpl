{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "wordpress.name" -}}
{{- default .Chart.Name .Values.wordpress.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wordpress.fullname" -}}
{{- if .Values.wordpress.fullnameOverride -}}
{{- .Values.wordpress.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.wordpress.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wordpress.chart" -}}
{{- printf "%s" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "wordpress.labels" -}}
app: {{ include "wordpress.name" . }}
{{- end }}


{{/*
Wordpress Selector labels
*/}}
{{- define "wordpress.selectorLabels" -}}
app: {{ include "wordpress.name" . }}
tier: {{ .Values.wordpress.spec.Selector.tier }}
{{- end -}}

{{/*
MySQL Selector labels
*/}}
{{- define "mysql.selectorLabels" -}}
app: {{ include "wordpress.name" . }}
tier: {{ .Values.mysql.spec.Selector.tier }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "wordpress.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "wordpress.fullname" .) .Values.wordpress.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.wordpress.serviceAccount.name }}
{{- end -}}
{{- end -}}
