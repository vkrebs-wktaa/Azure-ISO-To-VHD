# Run locally
Login to azure with `az login`

```
export RESOURCE_GROUP="OpsGlobal-Azure-ISO-To-VHD"
export REGION="germanywestcentral"
export VM_NAME="centos79-builder"
export VM_USERNAME="vkrebs"
export VM_PASSWORD="<password>"
export VM_SIZE="Standard_E4s_v4"

./create-inception.sh $RESOURCE_GROUP $REGION $VM_NAME $VM_USERNAME $VM_PASSWORD $VM_SIZE

./run-packer-build.sh $RESOURCE_GROUP $VM_NAME

export RESOURCE_GROUP="OpsGlobal-Azure-ISO-To-VHD"
export STORAGE_ACCOUNT_NAME="imgvhd7dxhp2wyxbmxg"
export STORAGE_CONTAINER_NAME=vhd
export BASE_IMAGE_NAME=baked-centos-7
export BUILD_ID=$(( $RANDOM % 9000 + 1000 ))

./run-upload-vhd.sh $RESOURCE_GROUP $VM_NAME $STORAGE_ACCOUNT_NAME $STORAGE_CONTAINER_NAME $BASE_IMAGE_NAME $BUILD_ID

export RESOURCE_GROUP="OpsGlobal-Azure-ISO-To-VHD"
export TEST_VM_NAME="schemaupdate"
export VM_USERNAME="vkrebs"
export VM_PASSWORD="<password>"
export TEST_VM_SIZE="Standard_D2s_v5"
./create-test-vm.sh $RESOURCE_GROUP $TEST_VM_NAME $STORAGE_ACCOUNT_NAME $STORAGE_CONTAINER_NAME $BASE_IMAGE_NAME $REGION $BUILD_ID $VM_USERNAME $VM_PASSWORD $TEST_VM_SIZE
```
