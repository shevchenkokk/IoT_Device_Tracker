ifeq ($(ver),)
	ver := "main"
endif

.PHONY: generate
generate:
	mkdir -p app/git_proto
	curl -o app/git_proto/device-tracker.proto "https://raw.githubusercontent.com/dak151449/IOT_Device_Tracker_Service/$(ver)/api/device_tracker/device_tracker.proto"
	mkdir -p app/lib/generated
	protoc --dart_out=grpc:app/lib/generated --proto_path=app/git_proto app/git_proto/device-tracker.proto google/protobuf/timestamp.proto
	rm -rf app/git_proto