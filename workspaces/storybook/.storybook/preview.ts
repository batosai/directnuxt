import type { Preview } from '@storybook/vue3-vite'

const preview: Preview = {
  parameters: {
    layout: 'centered',
    controls: {
      matchers: {
       color: /(background|color)$/i,
       date: /Date$/i,
      },
    }
  },
};

export default preview;