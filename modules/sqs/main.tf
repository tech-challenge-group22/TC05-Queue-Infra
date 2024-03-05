resource "aws_sqs_queue" "order-queue-finished" {
  content_based_deduplication       = false
  deduplication_scope               = "queue"
  delay_seconds                     = 0
  fifo_queue                        = true
  fifo_throughput_limit             = "perQueue"
  kms_data_key_reuse_period_seconds = 300
  kms_master_key_id                 = null
  max_message_size                  = 2048
  message_retention_seconds         = 86400
  name                              = "OrderQueueFinished.fifo"
  name_prefix                       = null
  policy                            = "{\"Statement\":[{\"Action\":[\"sqs:SendMessage\",\"sqs:ReceiveMessage\",\"sqs:DeleteMessage\",\"sqs:GetQueueAttributes\"],\"Effect\":\"Allow\"}],\"Version\":\"2012-10-17\"}"
  receive_wait_time_seconds         = 2
  redrive_allow_policy              = null
  redrive_policy                    = null
  sqs_managed_sse_enabled           = true
  tags                              = {}
  tags_all                          = {}
  visibility_timeout_seconds        = 30
}
