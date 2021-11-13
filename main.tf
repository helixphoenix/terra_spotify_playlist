terraform {
  required_providers {
    spotify = {
      version = "~>0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
}

provider "spotify" {
  api_key = var.spotify_api_key
}

data "spotify_search_track" "koop" {
  artist = "Koop"

}
data "spotify_search_track" "oak" {
  artist = "I Am Oak"

}

data "spotify_search_track" "portugal" {
  artist = "Portugal. The Man"

}
data "spotify_search_track" "shakira" {
  artist = "Shakira"

}
data "spotify_search_track" "sia" {
  artist = "Sia"

}
data "spotify_search_track" "guetta" {
  artist = "David Guetta"
}

data "spotify_search_track" "felix" {
  artist = "Felix Jaehn"

}

data "spotify_search_track" "stelar" {
  artist = "Parov Stelar"

}
data "spotify_track" "numbers" {
  url = "https://open.spotify.com/track/295WZ1UJn67ZaiQMWrSkys?si=00776e60425342ea"

}
data "spotify_track" "killer" {
  url= "https://open.spotify.com/track/5NAiPIEzxAexFE3ucV18Q8?si=18dd173d763c47ee"

}
data "spotify_track" "bruno" {
  url= "https://open.spotify.com/track/3w3y8KPTfNeOKPiqUTakBh?si=21c37d1b2ade4ef0"

}
data "spotify_track" "phoenix" {
  url= "https://open.spotify.com/track/1mvyqSb1tOvtVP1qfWEyPa?si=61cab1a1aeb249d3"

}
resource "spotify_playlist" "playlist" {
  name        = "Walking Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = flatten([
    data.spotify_search_track.koop.tracks[*].id,
    data.spotify_search_track.oak.tracks[*].id,
    data.spotify_search_track.shakira.tracks[*].id,
    data.spotify_search_track.felix.tracks[*].id,
    data.spotify_search_track.sia.tracks[*].id,
    data.spotify_search_track.guetta.tracks[*].id,
    data.spotify_search_track.portugal.tracks[*].id,
    data.spotify_search_track.stelar.tracks[*].id,
    data.spotify_track.numbers.id,
    data.spotify_track.killer.id,
    data.spotify_track.bruno.id,
    data.spotify_track.phoenix.id,




  ])
}

output "tracks" {
  value = [data.spotify_search_track.koop.tracks,data.spotify_search_track.oak.tracks]
}
