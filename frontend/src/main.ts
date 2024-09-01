import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { HomeComponent } from './app/vistas/home/home.component';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { AppModule } from './app/app.module';


bootstrapApplication(HomeComponent, appConfig)
  .catch((err) => console.error(err));

/* platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => console.error(err)); */
