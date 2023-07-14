#!/bin/sh -l

helm repo add ${INPUT_REPO_NAME} ${INPUT_HELM_REPO_URL}
helm repo add stable https://charts.helm.sh/stable

if [ "${UPDATE_DEPENDENCIES}" = "false" ]; then
  helm package --version="${HELM_TAG}" --app-version="${HELM_TAG}" "${INPUT_CHART_SUBDIR}"/.
else
  helm package -u --version="${INPUT_HELM_TAG}" --app-version="${HELM_TAG}" "${INPUT_CHART_SUBDIR}"/.
fi

RESPONSE=$(curl --data-binary "@${INPUT_CHART_SUBDIR}-${HELM_TAG}.tgz" "${INPUT_HELM_REPO_URL}"/api/charts)
echo "$RESPONSE"

if [ "$RESPONSE" = '{"saved":true}' ]; then
  exit 0
else
  exit 1
fi