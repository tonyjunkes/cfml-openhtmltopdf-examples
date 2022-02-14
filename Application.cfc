component {
    this.name = hash(getBaseTemplatePath());
    this.applicationTimeout = createTimeSpan(0, 2, 0, 0);
    this.javaSettings.loadPaths = directoryList(expandPath("/lib"), true, "path", "*.jar");
    this.mappings = {
        "/resources": expandPath("/resources"),
        "/components": expandPath("/components"),
        "/output": expandPath("/output")
    };
}
