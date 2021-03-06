
#' members_search
#'
#' Search for an MP or Lord by name and constituency
#'
#'Function searches for the string and returns a data frame with all matches from both houses of parliament. Returns all partial matches in the members' names, constituencies, twitter handle and webpage. The default search is NULL, which returns a data frame of all members of both houses, the same result as members('all').
#' @param Search Accepts any string. Defaults to NULL.
#' @keywords All Members of Parliament
#' @export
#' @examples \dontrun{
#'
#' x <- members_search('chris')
#'
#' x <- members_search(Search='chris')
#' }

members_search <- function(Search = NULL) {
    
    if (is.null(Search)) {
        members("all")
    } else {
        
        Search <- URLencode(Search)
        
        baseurl_MPID <- "http://lda.data.parliament.uk/members.json?_pageSize=500&_search=*"
        
        message("Connecting to API")
        
        mpidResults <- jsonlite::fromJSON(paste0(baseurl_MPID, Search, "*"))
        
        if (mpidResults$result$totalResults > mpidResults$result$itemsPerPage) {
            mpidJpage <- round(mpidResults$result$totalResults/mpidResults$result$itemsPerPage, digits = 0)
            
            pages <- list()
            
            for (i in 0:mpidJpage) {
                mydata <- jsonlite::fromJSON(paste0(baseurl_MPID, Search, "*", "&_page=", i), flatten = TRUE)
                message("Retrieving page ", i + 1, " of ", mpidJpage + 1)
                pages[[i + 1]] <- mydata$result$items
            }
            
            df <- jsonlite::rbind.pages(pages[sapply(pages, length) > 0])  #The data frame that is returned
            
        } else {
            df <- mpidResults$result$items
            
        }
        
    }
}

