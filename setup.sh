echo
echo "Starting Inference Model Service setup."
echo

cd granite-inference-service
./preparation.sh
./namespace.sh.local
./docker-secret.sh.local
./hf-secret.sh.local
oc apply -k .
cd ..

echo
echo "Inference Model Service setup completed."
echo