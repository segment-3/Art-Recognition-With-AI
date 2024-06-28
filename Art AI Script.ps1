$url = Read-Host "Enter the URL of the image"

$endpoint = "https://eastus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/3b2b0650-d05d-4fb0-8176-bd7b664d6b6c/classify/iterations/Iteration2/url"

$apiKey = "46f88570928b401ca8e6da5bb7de596b"

$Body = "{`"url`": `"$url`"}"

$headers = @{

    "Prediction-Key" = $apiKey
    "Content-Type" = "application/json"}

$response = Invoke-RestMethod -Uri $endpoint -Method Post -Headers $headers -Body $Body

foreach ($prediction in $response.predictions) {

    $Prob = $prediction.probability
    $TID = $prediction.tagId
    $TN = $prediction.tagName
    
    Write-Output "`tProbability: $Prob `tTagID: $TID `tTagName: $TN"}
