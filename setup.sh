echo
echo "Starting Inference Model Service setup."
echo

cd granite-inference-server
./preparation.sh
./namespace.sh.local
./docker-secret.sh.local
./hf-secret.sh.local
oc apply -k .
cd ..

echo
echo "Inference Model Service setup completed."
echo

# To monitor container downloading a model, use:
#
# oc get pods
# oc logs -f granite-...... -c fetch-model
#
# fetch-model container will exit when the model is downloaded,
# if any error occurs it will be shown in its logs like above.