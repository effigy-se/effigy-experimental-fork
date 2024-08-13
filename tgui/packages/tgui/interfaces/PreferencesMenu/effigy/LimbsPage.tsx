import { useBackend } from '../../../backend';
import {
  Box,
  Button,
  ColorBox,
  Dropdown,
  Section,
  Stack,
} from '../../../components';
import { CharacterPreview } from '../../common/CharacterPreview';
import { PreferencesMenuData } from '../data';

const Gap = (props: { amount: number }) => {
  // 0.2em comes from the padding-bottom in the department listing
  return <Box height={`calc(${props.amount}px + 0.2em)`} />;
};

export const RotateCharacterButtons = (props) => {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <Box mt={1}>
      <Button
        onClick={() => act('rotate', { backwards: false })}
        fontSize="22px"
        icon="redo"
        tooltip="Rotate Clockwise"
        tooltipPosition="bottom"
      />
      <Button
        onClick={() => act('rotate', { backwards: true })}
        fontSize="22px"
        icon="undo"
        tooltip="Rotate Counter-Clockwise"
        tooltipPosition="bottom"
      />
    </Box>
  );
};

export const Markings = (props) => {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <Stack fill vertical>
      <Stack.Item>Markings:</Stack.Item>
      {props.limb.markings.markings_list.map((marking, index) => (
        <Stack.Item key={marking.marking_id}>
          <Stack fill>
            <Stack.Item grow>
              <Dropdown
                width="100%"
                options={props.limb.markings.marking_choices}
                selected={marking.name}
                onSelected={(shit) =>
                  act('change_marking', {
                    limb_slot: props.limb.slot,
                    marking_id: marking.marking_id,
                    marking_name: shit,
                  })
                }
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                onClick={() =>
                  act('color_marking', {
                    limb_slot: props.limb.slot,
                    marking_id: marking.marking_id,
                  })
                }
              >
                <ColorBox color={marking.color} />
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Button
                color="bad"
                onClick={() =>
                  act('remove_marking', {
                    limb_slot: props.limb.slot,
                    marking_id: marking.marking_id,
                  })
                }
              >
                -
              </Button>
            </Stack.Item>
          </Stack>
        </Stack.Item>
      ))}
      <Stack.Item>
        <Button
          color="good"
          onClick={() => act('add_marking', { limb_slot: props.limb.slot })}
        >
          +
        </Button>
      </Stack.Item>
    </Stack>
  );
};

export const LimbPage = (props) => {
  const { act } = useBackend<PreferencesMenuData>();
  return (
    <div>
      <Section fill title={props.limb.name}>
        <Stack vertical fill>
          <Stack.Item>
            <Markings limb={props.limb} />
          </Stack.Item>
        </Stack>
      </Section>
    </div>
  );
};

export const LimbsPage = () => {
  const { data } = useBackend<PreferencesMenuData>();
  const { act } = useBackend<PreferencesMenuData>();
  const markings = [];
  return (
    <Stack minHeight="100%">
      <Stack.Item minWidth="33%" minHeight="100%">
        <Section fill scrollable title="Markings" height="222%">
          <div>
            {data.limbs_data.map((val) => (
              <LimbPage key={val.slot} limb={val} data={data} />
            ))}
          </div>
        </Section>
      </Stack.Item>
      <Stack.Item minWidth="33%">
        <Section title="Character Preview" fill align="center" height="222%">
          <CharacterPreview id={data.character_preview_view} height="25%" />
          <RotateCharacterButtons />
          <Gap amount={50} />
        </Section>
      </Stack.Item>
    </Stack>
  );
};
