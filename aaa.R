aaa <- function(fname) {
	data <- read.csv(fname)
	for(i in 1:length(data[ ,])) {
		if(data$oc_ra_eps[i] > data$oc_ra_sigma[i] & data$oc_de_eps[i] > data$oc_de_sigma) {
			tmp <- data$oc_ra_sigma[i]
			data$oc_ra_sigma[i] <- data$oc_ra_eps[i]
			data$oc_ra_eps[i] <- tmp
			tmp <- data$oc_de_sigma[i]
			data$oc_de_sigma[i] <- data$oc_de_eps[i]
			data$oc_de_eps[i] <- tmp
		}
	}

	data$yf <- round(data$yf, 10)
	data$d <- round(data$d, 8)
	data$ra_deg <- round(data$ra_deg, 7)
	data$de_deg <- round(data$de_deg, 7)

	write.csv(data, "uranian_satellites_final_version.csv", quote = F)
	write.table(data, "uranian_satellites_final_version.txt" ,sep ="\t", quote = F)

}