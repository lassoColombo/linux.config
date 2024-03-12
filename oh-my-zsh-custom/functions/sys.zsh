wherepath() {
	whereis $@ | cut -d ' ' -f2
}
