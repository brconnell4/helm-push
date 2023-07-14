#!/bin/sh -l

helm repo add ${INPUT_REPO_NAME} ${INPUT_HELM_REPO_URL}
helm repo add stable https://charts.helm.sh/stable

if [ "${UPDATE_DEPENDENCIES}" = "false" ]; then
  helm package --version="${INPUT_HELM_TAG}" --app-version="${INPUT_HELM_TAG}" "${INPUT_CHART_SUBDIR}"/.
else
  helm package -u --version="${INPUT_INPUT_HELM_TAG}" --app-version="${INPUT_HELM_TAG}" "${INPUT_CHART_SUBDIR}"/.
fi

ls -la

RESPONSE=$(curl --data-binary "@${INPUT_CHART_SUBDIR}-${INPUT_HELM_TAG}.tgz" "${INPUT_HELM_REPO_URL}"/api/charts)
echo "$RESPONSE"

if [ "$RESPONSE" = '{"saved":true}' ]; then
  exit 0
else
  exit 1
fi