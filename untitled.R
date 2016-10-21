readresult <- function(data) {
	inp <- read.csv(data)
			names(inp) <- c("N", "name", "count", "yf", "y",	"m", "d", "ra_deg", "ra_h",
				"ra_m", "ra_s", "de_deg", "de_d", "de_m", "de_s",
				"oc_ra","oc_de","oc_ra_sigma","oc_de_sigma","oc_ra_eps","oc_de_eps"
				)
	inp
	
}

presentdata <- function(fname) {
	data <- readresult(fname)
	data$d <- as.numeric(data$d)
	data$name <- as.character(data$name)
	days <- floor(data$d)
	hours <- floor((data$d - days) * 24)
	minutes <- floor(((data$d - days) * 24 - hours) * 60)
	secunds <- round(((data$d - days) * 24 - hours) * 60 - minutes, 4)
	resdata <- data.frame(sat = as.character(data$name), year = data$y, month = data$m, day = days,
							UT_h = hours, UT_m = minutes, UT_s = secunds,
							RA_h = data$ra_h, RA_m = data$ra_m, RA_s = round(data$ra_s, 3), RA_SEM = data$oc_ra_eps,
							DEC_deg = data$de_d, DEC_arcm = data$de_m, DEC_arcs = data$de_s, DEC_SEM = data$oc_de_eps,
							epoch = "J2000", ref_catalog = "UCAC4", Obs_code = 084)
	resdata$sat <- as.character(resdata$sat)
	resdata$sat[which(resdata$sat == "u1        ")] <- "u1"
	resdata$sat[which(resdata$sat == "u2        ")] <- "u2"
	resdata$sat[which(resdata$sat == "u3        ")] <- "u3"
	resdata$sat[which(resdata$sat == "u4        ")] <- "u4"
	write.csv(resdata, file = "Pulkovo_Uran_sat_obs.csv",, row.names = F, quote = F)
	write.table(resdata, file = "Pulkovo_Uran_sat_obs.txt",sep = "  ", row.names = F, quote = F)
	write.table(resdata$DEC_deg, "tmp.dat", row.name = F)

}