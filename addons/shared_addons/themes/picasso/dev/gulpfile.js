//@plugins

var gulp = require("gulp"),
	sass = require("gulp-sass"),
	concat = require("gulp-concat"),
	watch = require("gulp-watch"),
	minify_css = require("gulp-minify-css"),
	sourcemaps = require("gulp-sourcemaps"),
	notify = require("gulp-notify"),
	prefix = require("gulp-autoprefixer"),
	safe = require('gulp-safe'),
	hash = require('gulp-hash-filename');

//@settings

var fileName = {
	base: 'base.min.css',
	theme: 'default.min.css',
	materialize: 'materialize.min.css',
	project: 'logyvalor'
	
};

var filesToCopy = [
        '../views/modules/**/*.*'
  ];

var basePath = {
    src: 'sass/smacss/',
    dest: '../css/',
		framework:  '../css/frameworks/',
		materialize: 'sass/myFramework/materialize/',
		theme: '../css/themes/'
};

var src = {
	sass_all: '**/*.sass',
	sass: 'sass/main.sass',
	views: '../views/**/*',
	materialize: basePath.materialize + '**/*.scss',
	base: basePath.src + 'base.sass',
	module: basePath.src + 'module.sass',
	layout: basePath.src + 'layout.sass',
	state: basePath.src + 'state.sass',
	theme: basePath.src + 'theme.sass',


};
var output = {
	css: basePath.dest,
	materialize: basePath.framework,
	theme: basePath.theme
};


//@tasks runner

gulp.task('base', function () {
//	return gulp.src([src.base, src.module, src.layout, src.state])
		return gulp.src([src.sass])
		.pipe(sourcemaps.init({
			loadMaps: true
		}))
		.pipe(sass({
			indentedSyntax: true,
			errLogToConsole: false,
			onError: function (err) {
				return notify({
					title: 'ERROR BASE',
				}).write(err);
			}
		}))
		.pipe(prefix('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
		.pipe(concat(fileName.base))
		.pipe(minify_css())
		.pipe(gulp.dest(output.css))
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest(output.css))
		.pipe(notify({
			title: 'SUCCESS BASE',
			message: 'task completed'
		}))
});

gulp.task('theme', function () {
	return gulp.src(src.theme)
		.pipe(sourcemaps.init({
			loadMaps: true
		}))
		.pipe(sass({
			indentedSyntax: true,
			errLogToConsole: false,
			onError: function (err) {
				return notify({
					title: 'ERROR THEME',
				}).write(err);
			}
		}))
		.pipe(prefix('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
		.pipe(concat(fileName.theme))
		.pipe(minify_css())
		.pipe(gulp.dest(output.theme))
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest(output.theme))
		.pipe(notify({
			title: 'SUCCESS THEME',
			message: 'task completed'
		}))
});

gulp.task('materialize', function () {
	return gulp.src(src.materialize)
		.pipe(sourcemaps.init({
			loadMaps: true
		}))
		.pipe(sass({
			errLogToConsole: false,
			onError: function (err) {
				return notify({
					title: 'ERROR MATERIALIZE',
				}).write(err);
			}
		}))
		.pipe(prefix('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
		.pipe(concat(fileName.materialize))
		.pipe(minify_css())
		.pipe(gulp.dest(output.materialize))
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest(output.materialize))
		.pipe(notify({
			title: 'SUCCESS MATERIALIZE',
			message: 'task completed'
		}))
});


gulp.task('copy', function () {
	var dest;
 
    dest = "../../../../../../backupsDev/" + fileName.project + "/" 
	
	return gulp.src('../views/modules/**/*.*')
	.pipe(safe('dest', {backup: false, format: ""}))
	.pipe(hash({
        "format": "{name}-{mtime}{ext}"
    }))
  .pipe(gulp.dest(dest))
	.pipe(notify({
			title: 'SUCCESS COPY',
			message: 'task completed'
		}))
});




gulp.task('watch', function () {
	gulp.watch(src.materialize, ['materialize']);
	gulp.watch(src.sass_all, ['base']);
//	gulp.watch(src.sass, ['theme']);
//	gulp.watch(src.views, ['copy']);
	
});

//@Tasks

//gulp.task('default', ['watch', 'materialize', 'base', 'theme', 'copy' ]);
gulp.task('default', ['watch', 'base']);