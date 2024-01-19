class FileUploadProgressEvent {
  final num sent, total;
  final String tag;

  FileUploadProgressEvent(this.sent, this.total, this.tag);
}
