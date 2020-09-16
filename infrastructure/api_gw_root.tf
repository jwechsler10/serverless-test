# resource "aws_api_gateway_rest_api" "main" {
#   name = "regional-example"
#
#   endpoint_configuration {
#     types = ["REGIONAL"]
#   }
# }
#
# resource "aws_api_gateway_resource" "index" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   parent_id   = aws_api_gateway_rest_api.main.root_resource_id
#   path_part   = "{proxy+}"
# }
#
# resource "aws_api_gateway_method" "get_index" {
#   rest_api_id   = aws_api_gateway_rest_api.main.id
#   resource_id   = aws_api_gateway_resource.index.id
#   http_method   = "ANY"
#   authorization = "NONE"
#
#   request_parameters = {
#     "method.request.path.proxy" = true
#   }
# }
#
# resource "aws_api_gateway_integration" "index_integration" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   resource_id = aws_api_gateway_resource.index.id
#   http_method = aws_api_gateway_method.get_index.http_method
#   integration_http_method = aws_api_gateway_method.get_index.http_method
#   type        = "AWS"
#   uri         = "arn:aws:apigateway:${data.aws_region.current.name}:s3:${aws_s3_bucket.front_end_bucket.arn}"
# }
#
# resource "aws_api_gateway_method_response" "response_200" {
#   rest_api_id = aws_api_gateway_rest_api.main.id
#   resource_id = aws_api_gateway_resource.index.id
#   http_method = aws_api_gateway_method.get_index.http_method
#   status_code = "200"
# }
