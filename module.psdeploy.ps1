if($ENV:BHProjectName -and $ENV:BHProjectName.Count -eq 1) {
    Deploy "$ENV:BHProjectName => PSGallery" {
        By PSGalleryModule {
            FromSource $ENV:BHProjectName
            To PSGallery
            WithOptions @{
                ApiKey = $ENV:PSGalleryApiKey
            }
        }
    }
}
