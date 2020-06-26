#!/usr/bin/env bash
#
# Script for handeling snapshotting multiple virtualmachines with virsh for libvirtd (save/restore/list/delete) 
# Author: MTO (https://www.mto.nu)

declare -a vms
vms=("control" "node1" "node2" "node3" "node4")

_snapshot_create(){
    echo "Create snapshot " $SNAPSHOT_NAME
    echo ""

    for vm in ${vms[@]}; do
      echo "Create $vm:" 
      virsh snapshot-create-as $vm --name $SNAPSHOT_NAME
    done
} 

_snapshot_restore(){
    echo "Restore snapshot " $SNAPSHOT_NAME
    echo ""

    for vm in ${vms[@]}; do
      echo "Reset $vm:"
      virsh snapshot-revert $vm --snapshotname $SNAPSHOT_NAME --running
    done
}

_snapshot_list(){
    echo "List snapshots " $SNAPSHOT_NAME
    echo ""

    for vm in ${vms[@]}; do
      echo "List $vm:"
      virsh snapshot-list $vm
    done
}

_snapshot_delete(){
    echo "Delete snapshot " $SNAPSHOT_NAME
    echo ""

    for vm in ${vms[@]}; do
      echo "Delete $vm:"
      virsh snapshot-delete $vm --snapshotname $SNAPSHOT_NAME
    done
}

SNAPSHOT_ACTION="$1"
SNAPSHOT_NAME="$2"

if [ -z "$SNAPSHOT_NAME" ] && [ "$SNAPSHOT_ACTION" != "list" ] && [ ! -z "$SNAPSHOT_ACTION" ]; then
  echo "You must set a snapshotname for action  => ./snapshot.sh $SNAPSHOT_ACTION snapshotname"
  exit 1
fi

case "$SNAPSHOT_ACTION" in
  create)
     _snapshot_create
  ;;
  restore)
    _snapshot_restore
  ;;
  list)
    _snapshot_list
  ;;
  delete)
    _snapshot_delete
  ;;
  *)
    echo "Usage:   $0 snapshotaction snapshotname"
    echo "Create:  $0 create snapshotname"
    echo "Restore: $0 restore snapshotname"
    echo "List:    $0 list"
    echo "Delete:  $0 delete snapshotname"
    echo ""
    echo "Use this shell script to snapshot multple libvirt/kvm virtual machines at once."
    echo "Fill the array vms with the names of tne libvirt/kvm vm."
esac 