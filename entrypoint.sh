#!/bin/sh -l

echo RepoName: "${REPO_NAME}"
echo RepoURL "${HELM_REPO_URL}"
ls -la
pwd

#helm repo add ${REPO_NAME} ${HELM_REPO_URL}
#helm repo add stable https://charts.helm.sh/stable
#
#if [ "${UPDATE_DEPENDENCIES}" = "false" ]; then
#  helm package --version="${HELM_TAG}" --app-version="${HELM_TAG}" "${CHART_SUBDIR}"/.
#else
#  helm package -u --version="${HELM_TAG}" --app-version="${HELM_TAG}" "${CHART_SUBDIR}"/.
#fi
#
#RESPONSE=$(curl --data-binary "@${CHART_SUBDIR}-${HELM_TAG}.tgz" "${HELM_REPO_URL}"/api/charts)
#echo "$RESPONSE"
#
#if [ "$RESPONSE" = '{"saved":true}' ]; then
#  exit 0
#else
#  exit 1
#fi